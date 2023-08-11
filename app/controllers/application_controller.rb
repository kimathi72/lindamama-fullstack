class ApplicationController < ActionController::API
    include ActionController::Cookies

    before_action :authorize
    before_action :is_doc
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, 'my_s3cr3t')
    end
  
    def auth_header
      # { Authorization: 'Bearer <token>' }
      request.headers['Authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
    def current_user
      # Doctor.find_by(id: session[:current_user])
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
    def logged_in?
      !!current_user
    end

    def authorize
      render json: { errors: ["Not authorized"] }, status: :unauthorized unless current_user
    end

    def is_doc
      return render json: { error: "Not Authorized" }, status: :unauthorized unless current_user.doc
    end

    private

    def record_invalid_response(invalid)
      render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found(notfound)
      render json: {error: "#{notfound.model} not found"}, status: :not_found
    end

  end
