class PatientsController < ApplicationController
  skip_before_action :is_doc, only: [:create]
  skip_before_action :authorize, only: [:create]

  def index
    render json: Patient.all.order(:name), status: :ok
  end

  def show
    patient = Patient.find(params[:id])
    render json: patient, status: :ok
  end

  def create
    @patient = Patient.create(patient_params)
    if @patient.valid?
      @token = encode_token(patient_id: @patient.id)
      from = Email.new(email: 'roy.kimathi@student.moringaschool.com')
      to = Email.new(email: @user.email)
      subject = 'Welcome to Linda Mama'
      content = Content.new(type: 'text/plain', value: @token)
      mail = Mail.new(from, subject, to, content)

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response
    render json: {patient: PatientSerializer.new(@patient), jwt: @token}, status: :created
  end

  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    head :no_content
  end

  private

  def patient_params
    params.permit(:name, :age, :birthday, :email, :password, :doc)
  end

end
