require 'faker'

puts "🌱 Seeding spices..."
puts 'Seeding departments..'
Department.create(name: 'Anesthesiology', image: 'https://www.teamhealth.com/wp-content/uploads/2020/05/TH-12623-June-Blog_CAA2_Blog.jpg')
Department.create(name: 'Cardiology', image: 'https://cdn-prod.medicalnewstoday.com/content/images/articles/248/248935/cardiology-cath-lab.jpg')
Department.create(name: 'Ear, Nose, and Throat (ENT)', image: 'https://www.harleystreetent.com/sites/default/files/field/image/when-should-you-see-an-ent-specialist.jpg')
Department.create(name: 'Pediactrics', image: 'https://www.communitycare.com/Content/images/Clifton-Park-Pediatrics-On-Site-Services-1200x600.jpg')
Department.create(name: 'Emergency Medicine', image: 'https://college.mayo.edu/media/mccms/content-assets/academics/residencies-and-fellowships/programs-a-z/emergency-medicine-3602650-0053.jpg')
Department.create(name: 'General Surgery', image: 'https://www.facs.org/media/hsppzco1/532331964.jpg?anchor=center&mode=crop&rnd=132954458115670000')
Department.create(name: 'Hematology', image: 'https://www.morainevalley.edu/wp-content/uploads/2021/12/D694PHL033-700x467.jpg')
Department.create(name: 'Oncology', image: 'https://d7fi61gsgzcz4.cloudfront.net/assets/impact-hero-images/gettyimages-961287944_2500.jpg/dynamic:1-aspect:2.5-fit:cover-strategy:entropy/gettyimages-961287944_2500--1800.jpg')
Department.create(name: 'Vascular', image: 'https://www.mayoclinic.org/-/media/kcms/gbs/patient-consumer/images/2019/06/10/17/57/vascular-surgery-8col-3861762-0036.jpg')
Department.create(name: 'Neurology', image: 'https://www.amc.edu/patient/services/neurosciences/neurology/images/neuro.jpg')

puts 'Seeding doctors..'
Doctor.create(title: 'MD', name: 'Patch Adams', bio: Faker::Movies::Hobbit.quote, department_id: 10, email: 'patchadams@gmail.com', password: '123', doc: true)
15.times do
  Doctor.create(
    title: 'MD',
    name: Faker::Movies::LordOfTheRings.character,
    bio: Faker::Movies::Hobbit.quote,
    department_id: rand(1..Department.all.size),
    email: "#{Faker::Internet.username}@gmail.com",
    password: Faker::Internet.password,
    doc: true
  )
end
15.times do
  Doctor.create(
    title: 'DO',
    name:Faker::Movies::LordOfTheRings.character,
    bio: Faker::Movies::Hobbit.quote,
    department_id: rand(1..Department.all.size),
    email: "#{Faker::Internet.username}@gmail.com",
    password: Faker::Internet.password,
    doc: true
  )
end

puts 'Seeding patients..'
Patient.create(name: "Ben Anthony", age: rand(18..65), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), email: "ba1@gmail.com", password: "123", doc: false)
20.times do
  Patient.create(
    name: Faker::Movies::LordOfTheRings.character,
    age: rand(18..65),
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    email: Faker::Internet.free_email,
    password: Faker::Internet.password,
    doc: false
  )
end

# .strftime('%a %b %d %Y %H:%M:%S GMT-0400 (Eastern Daylight Time)')
puts 'Seeding appointments..'
50.times do
  Appointment.create(
    doctor_id: 1,
    patient_id: rand(1..Patient.all.size),
    title: Faker::Movie.title,
    location: Faker::Movies::LordOfTheRings.location,
    startDate: DateTime.new(2023,8,rand(1..30),rand(1..19),rand(1.60)),
    endDate: DateTime.new(2023,9,rand(1..30),rand(6..19),rand(1.60)),
    notes: Faker::Fantasy::Tolkien.poem
  )
end

puts 'Seeding results..'
5.times do
  Result.create(
    WBC: rand(3.5..10.5),
    RBC: rand(4.5..6.0),
    hemoglobin: rand(14.0..18.0),
    hematocrit: rand(42.0..52.0),
    platelets: rand(140..415),
    sodium: rand(134..144),
    potassium: rand(3.5..5.2),
    bun: rand(9..20),
    calcium: rand(8.7-10.2),
    patient_id: 1,
    test_date: DateTime.new(2023,6,rand(1..30),rand(1..19),rand(1.60))
  )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# seed data for diet_blogs
#
diet_blogs = DietBlog.create([
  {
    title: "General Health",
    image: "https://plus.unsplash.com/premium_photo-1664453892264-3ba24a55bec1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJlZ25hbnR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    content: """
              Nutrition plays a crucial role in a healthy pregnancy, as it not only supports the development of the baby but also ensures the well-being of the mother. Here are some essential guidelines on what to eat and what to avoid during pregnancy:

<h1>What to Eat:</h1>
<ol>
<li>Fruits and Vegetables:</b> Incorporate a variety of colorful fruits and vegetables into your diet to ensure a rich supply of vitamins, minerals, and antioxidants. These are essential for both the baby's growth and the mother's overall health.</li>

<li>Whole Grains:</b> Opt for whole grains like whole wheat, brown rice, quinoa, oats, and barley. These provide fiber, which aids digestion and helps prevent constipation—a common issue during pregnancy.</li>

<li>Protein:</b> Consume adequate protein from sources like lean meats, poultry, fish, eggs, dairy products, legumes, tofu, and nuts. Protein is essential for the baby's tissue development and supports the mother's increased blood volume.</li>

<li>Calcium-Rich Foods:</b> Dairy products, leafy greens (kale, spinach), and fortified plant-based milk are excellent sources of calcium, which is essential for the baby's bone development and the mother's bone health.</li>

<li>Iron-Rich Foods:</b> Include iron-rich foods like lean red meat, poultry, fish, beans, lentils, tofu, and fortified cereals. Iron supports the production of red blood cells and helps prevent anemia in both the mother and the baby.</li>

<li>Folic Acid:</b> Consume foods high in folic acid, such as leafy greens, citrus fruits, fortified cereals, and beans. Folic acid is crucial during early pregnancy to prevent neural tube defects in the baby's brain and spine.</li>

<li>Healthy Fats:</b> Include sources of healthy fats like avocados, nuts, seeds, and olive oil. These fats provide essential fatty acids and support the baby's brain and eye development.</li>

<h1>What to Avoid:</h1>

Certain Fish: Limit the consumption of fish high in mercury, such as swordfish, shark, king mackerel, and tilefish. Mercury can harm the baby's developing nervous system.

Raw or Undercooked Seafood, Eggs, and Meat: Avoid consuming raw or undercooked seafood, eggs, and meat to reduce the risk of foodborne illnesses like listeria or salmonella.

Unpasteurized Dairy Products: Avoid unpasteurized milk, cheese, and other dairy products, as they may contain harmful bacteria that can cause foodborne illnesses.

Highly Processed Foods: Minimize the intake of highly processed and sugary foods, as they provide empty calories and little nutritional value.

Caffeine and Alcohol: Limit caffeine intake and avoid alcohol altogether during pregnancy, as they can pose risks to the baby's development.

Raw Sprouts: Steer clear of raw sprouts like alfalfa, clover, mung bean, and radish, as they may carry bacteria that can cause foodborne illnesses.

Remember, each pregnancy is unique, so it's essential to consult with your healthcare provider or a registered dietitian to tailor your diet according to your specific needs and medical history. A balanced and healthy diet during pregnancy is one of the best ways to ensure a healthy pregnancy and a thriving baby.
             """
  },
  {
    title: "Eating for Two: Nourishing Your Pregnancy Journey ",
    image: "https://images.unsplash.com/photo-1501516834911-269dbce099a0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1176&q=80",
    content: """
    <h3>Introduction:</h3>

Pregnancy is a remarkable journey filled with excitement, anticipation, and physical changes.
As an expectant mother, you want nothing but the best for your growing baby.

One of the most crucial ways to support your baby's development and ensure a
healthy pregnancy is through proper nutrition. While the saying \"eating for two\" is commonly used, it's essential to understand what it truly means and how to make the
most of your diet during this special time. In this blog, we'll delve into the concept of \"eating for two\" in pregnancy
and offer practical tips to nourish your body and your baby with a balanced and fulfilling diet.

The Meaning of <b>\"Eating for Two\"</b> in Pregnancy:

<b>\"Eating for two\"</b> does not imply doubling your food intake during pregnancy. Instead, it emphasizes the need for consuming nutrient-dense foods that provide essential vitamins, minerals, and nutrients for both you and your baby. Your body's nutritional needs increase during pregnancy to support the baby's growth and development, but the quality of your diet is far more important than the quantity. Striking a balance and making informed food choices will contribute to a healthy pregnancy and the well-being of your little one.

<b>Consult with Your Healthcare Provider:</b>

Every pregnancy is unique, and individual nutritional needs may vary. It's essential to consult with your healthcare provider or a registered
dietitian to tailor your diet plan according to your specific requirements.

  They can offer personalized advice, address any concerns, and ensure you are on track for a healthy pregnancy.
  """
  },
  {
    title: "Nurturing Life: The Vital Role of Water",
    image: "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80",
    content: """
    <h3>Introduction:</h3>
Pregnancy is a miraculous journey that demands special care and attention to ensure the well-being of both the mother and the growing baby. As the foundation of life, water plays a crucial role in supporting various physiological functions and promoting a healthy pregnancy. In this blog, we delve into the significance of water during pregnancy, highlighting its benefits, recommended intake, and practical tips for staying adequately hydrated.

<h4>Hydration for Two:</h4>
Water is the elixir of life, and during pregnancy, it becomes even more essential. As the baby develops in the womb,
the mother's body undergoes significant changes, and water is required to support these processes. Adequate hydration ensures that essential
nutrients and oxygen are efficiently transported to the baby, supporting its growth and development.

<h4>Promoting Healthy Amniotic Fluid Levels:</h4>
Amniotic fluid acts as a protective cushion for the baby in the womb, helping to shield it from external impacts.
Staying well-hydrated ensures a healthy and consistent amniotic fluid level, which aids in maintaining the baby's
buoyancy and providing a stable environment for optimal growth.

<h4>Preventing Common Pregnancy Issues:</h4>
Dehydration can contribute to various pregnancy-related discomforts such as constipation, urinary tract infections,
and even preterm labor. By drinking enough water, expectant mothers can reduce the risk of these complications
and maintain overall well-being throughout their pregnancy.

<h4>Enhancing Nutrient Absorption:</h4>
Water is instrumental in facilitating the absorption of essential nutrients from the food expectant mothers consume.
Proper hydration aids in breaking down food and transporting nutrients to the baby, ensuring they receive the necessary
nourishment for their development.

<h4>Regulating Body Temperature:</h4>
Pregnant women are more prone to overheating due to hormonal changes and increased blood volume.
Staying hydrated helps regulate body temperature and reduces the risk of overheating, which can be harmful to both mother and baby.

<h4>Combating Fatigue and Boosting Energy Levels:</h4>
Pregnancy can be physically and emotionally taxing, often leading to fatigue.
Drinking enough water helps combat fatigue, keeping the body energized and supporting the mother throughout her journey.

<h4>Optimal Placental Function:</h4>
The placenta plays a vital role in supplying nutrients and oxygen to the baby while removing waste products. A well-hydrated mother ensures that the placenta functions optimally, fostering a healthy environment for the baby's growth.

Tips for Staying Hydrated:

a. Carry a Water Bottle: Always keep a water bottle with you, making it easier to sip water throughout the day.

b. Set Hydration Reminders: With busy schedules, it's easy to forget to drink water. Set reminders on your phone to prompt regular water intake.

c. Infuse Water with Fruits: Add slices of fresh fruits like lemon, cucumber, or berries to your water for a refreshing and tasty twist.

d. Drink Water with Meals: Make it a habit to drink water with each meal to aid digestion and nutrient absorption.

e. Avoid Excessive Caffeine and Sugary Drinks: While occasional indulgence is okay, it's essential to limit caffeinated and sugary beverages, as they can lead to dehydration.

<h3>Conclusion:</h3>
As an expecting mother, your journey to nurturing life starts with nurturing yourself. Embrace the power of water and make hydration a top priority during your pregnancy. By staying adequately hydrated, you're providing the best environment for your baby to grow and thrive, and you're also taking care of yourself, ensuring a healthier and more enjoyable pregnancy experience. Remember, every sip counts, and together, we celebrate the incredible significance of water in this beautiful journey of pregnancy
    """
  },
  {
    title: "Understanding and Managing Morning Sickness",
    image: "https://plus.unsplash.com/premium_photo-1664376075271-b9e75c3bf11c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1916&q=80",
    content: """
    <h3>Introduction:</h3>

Nausea and vomiting during pregnancy, commonly known as morning sickness, is a widespread occurrence that affects
a significant number of expectant mothers. While the name suggests that symptoms only occur in the morning, morning sickness
can actually happen at any time of the day. In this section, we'll delve into the causes of morning sickness,
its impact on pregnant women, and practical tips to manage and alleviate its symptoms.

<b>Causes of Morning Sickness:</b>

The exact cause of morning sickness is not fully understood, but it is believed to be related to the hormonal changes that
occur during pregnancy. Elevated levels of human chorionic gonadotropin (hCG) and estrogen are thought to contribute to
nausea and vomiting. Other factors, such as a heightened sense of smell and increased sensitivity to certain foods, may also play
a role in triggering morning sickness.

<b>Impact on Pregnant Women:</b>

Morning sickness can vary in severity and duration from woman to woman. For some, it may be a mild inconvenience, while for others,
it can be more debilitating and affect their daily life. In most cases, morning sickness tends to subside by the end of the first trimester,
but some women may experience it throughout their pregnancy.

<b>Tips to Manage Morning Sickness:</b>
<ol>
<li>While morning sickness cannot be completely prevented, there are several strategies that pregnant women can adopt to manage its symptoms
and improve their overall well-being:</li>

<li>Eat Small, Frequent Meals: Instead of having three large meals, opt for five or six smaller meals throughout the day.
This can help prevent an empty stomach, which can trigger nausea.</li>

<li>Stay Hydrated: Sip on fluids between meals to stay hydrated. Avoid drinking large amounts of water during meals, as it may make you feel
bloated.</li>

<li>Avoid Trigger Foods: Identify foods that worsen your morning sickness and avoid them.
Common trigger foods include <b>spicy, greasy, or heavily seasoned dishes.</b></li>

<li>Ginger: Ginger has natural anti-nausea properties. Consider incorporating ginger tea, ginger candies, or ginger-infused foods into your
diet.</li>

<li>Vitamin B6: Some studies suggest that vitamin B6 supplements may help reduce the severity of morning sickness.
Consult your healthcare provider before taking any supplements.</li>

<li>Acupressure: Applying pressure to the P6 acupressure point on your wrist may help alleviate nausea. You can use wristbands designed for this
purpose or try gentle pressure with your fingers.</li>

<li>Fresh Air: If possible, spend some time outdoors and get fresh air, as it may help ease nausea.</li>

<li>Rest and Manage Stress: Ensure you get enough rest and manage stress levels. Fatigue and stress can exacerbate morning sickness
symptoms.</li>

<li>Prevent Strong Odors: Strong smells can trigger nausea.
  Avoid cooking or being around foods with strong odors that may be off-putting during pregnancy.</li>
"""
  },
  {
    title: "Nurturing Your Baby Bump: Healthy Snacking",
    image:"https://images.unsplash.com/photo-1504387720438-88468770d0fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTZ8fGhlYWx0aHklMjBzbmFja3N8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    content: """
    <h3>Introduction:</h3>
    Pregnancy is a transformative journey marked by incredible changes both inside and outside the
    body. As an expectant mother, your diet plays a crucial role in nourishing your growing baby and ensuring a healthy pregnancy.
    Snacking, when done right, can be a delightful way to maintain energy levels, curb cravings, and provide essential nutrients
    to support your baby's development. In this blog, we'll explore the importance of healthy snacking during pregnancy and share
    some delicious and nutritious snack ideas that will keep you and your baby happy and healthy.

    <h4>The Importance of Healthy Snacking During Pregnancy:</h4>

    <p><br><b>Sustaining Energy Levels:<br></b> Pregnancy can lead to fluctuations in energy levels, especially during the first and third trimesters. Healthy snacks help you maintain a stable blood sugar level, preventing energy crashes and keeping fatigue at bay.</p>
    <p><br><b>Supplying Essential Nutrients:</b><br> Your baby depends on you for proper nourishment. Snacking on nutrient-dense foods ensures that you receive a wide array of vitamins, minerals, and antioxidants crucial for your baby's development.</p>
    <p><br><b>Curbing Nausea and Cravings:</b><br>Nausea and food cravings are common during pregnancy. Opting for wholesome snacks can help alleviate these symptoms while avoiding excessive consumption of unhealthy treats.</p>
    <p><br><b>Supporting Healthy Weight Gain:</b><br> Gaining weight is a natural part of pregnancy. However, excessive weight gain can lead to complications. Healthy snacking can help you maintain a healthy weight and support your baby's growth.</p>

    <h4>Healthy Snack Ideas:</h4>
    <p><br><b>Fruits and Vegetables:</b><br> Fruits and vegetables are packed with essential nutrients and antioxidants. They're also rich in fiber, which helps prevent constipation, a common pregnancy symptom. Consider snacking on fresh fruits and vegetables, such as apples, bananas, carrots, and cucumbers. You can also incorporate them into smoothies, salads, and other dishes.</p>
    <p><br><b>Whole Grains:</b><br> Whole grains are a great source of fiber, vitamins, and minerals. They also help you feel full for longer, preventing overeating. Consider snacking on whole grain bread, crackers, or oatmeal.</p>
    <p><br><b>Protein:</b><br> Protein is essential for your baby's growth and development. It also helps you feel full and energized. Consider snacking on protein-rich foods, such as nuts, seeds, eggs, and yogurt.</p>

    <h4>Conclusion:</h4>
    <p>Healthy snacking during pregnancy is a valuable opportunity to provide your body and growing baby with the essential nutrients they need. By incorporating a variety of nutrient-dense snacks into your daily routine, you can ensure a healthier pregnancy and contribute to your baby's development. Remember to choose whole, unprocessed foods, and stay hydrated. Embrace this unique time in your life, and savor the joy of nourishing yourself and your little one on the way.</p>
    """
  },
  {
    title: "The Importance of a Balanced Diet ",
    image:"https://plus.unsplash.com/premium_photo-1664640733870-15cb6a5b6ee6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
    content: """
    <h3>Introduction:</h3>
    <p>Pregnancy is a special and critical time in a woman's life. During these nine months, a balanced diet becomes even more essential as it directly impacts the health and well-being of both the expectant mother and her developing baby. A balanced diet provides the necessary nutrients, vitamins, and minerals that are crucial for the healthy growth and development of the baby. In this blog, we will explore the reasons why a balanced diet is so important for expectant ladies.</p>

    <h4>Optimal Nutrient Intake:</h4>
    <p>During pregnancy, a woman's body undergoes significant changes to support the growth and development of the fetus. Proper nutrition is vital to ensure that both the mother and baby receive all the essential nutrients they need. A balanced diet should include a variety of food groups such as fruits, vegetables, whole grains, lean proteins, and dairy products. These provide essential nutrients like folic acid, iron, calcium, and omega-3 fatty acids, which are crucial for fetal brain development and overall health.</p>

    <h4>Supporting Baby's Development:</h4>
    <p>The early stages of pregnancy are particularly critical for the baby's development. A balanced diet helps provide the necessary building blocks for the baby's organs and tissues to form properly. Folic acid, for instance, helps prevent neural tube defects, while iron supports the formation of red blood cells and prevents anemia in both the mother and the baby.</p>

    <h4>Managing Weight Gain:</h4>
    <p>During pregnancy, a woman's body naturally gains weight to accommodate the growing baby. While weight gain is normal and healthy, it is essential to ensure that it remains within a healthy range. A balanced diet can help achieve this by preventing excessive weight gain, which can lead to complications during pregnancy and delivery.</p>

    <h4>Energy and Vitality:</h4>
    <p>Pregnancy can be a physically and emotionally taxing time for expectant mothers. A balanced diet can help maintain energy levels and prevent fatigue. It can also help alleviate common pregnancy symptoms such as nausea, constipation, and heartburn.</p>

    <h4>Reducing Pregnancy Complications:</h4>
    <p>Maintaining a balanced diet can help reduce the risk of certain pregnancy complications, such as gestational diabetes and preeclampsia. By managing blood sugar levels and blood pressure through a healthy diet, expectant mothers can enhance their chances of a smooth pregnancy and delivery.</p>

    <h4>Postpartum Recovery:</h4>
    <p>A well-balanced diet can help speed up postpartum recovery by providing the necessary nutrients to support the healing process. It can also help prevent postpartum depression by supporting the production of mood-regulating hormones.</p>

    <h4>Conclusion:</h4>
    <p>A balanced diet is of utmost importance during pregnancy, as it provides the essential nutrients for the healthy growth and development of the baby while supporting the overall well-being of the expectant mother. A variety of nutrient-rich foods ensure that both the baby and the mother receive the necessary vitamins, minerals, and energy throughout this transformative journey. By making informed dietary choices and consulting with healthcare professionals, expectant ladies can take a significant step towards ensuring a happy and healthy pregnancy.</p>
    """
  },
])

# seed data for diet_tips


puts "🌱 Seeding done..."
