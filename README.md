# Cloud Application Development
# NCI BSCHE4 Project

## Brief
You are required to design and develop a SHC-PMS (Smart Health Care-Patient Management System). SHC-PMS is an information system that is intended for use in various clinics/ centres in Ireland. The patient record can be accessed in any clinic/ centre all over the Ireland. The application should be developed using Rails and should provide the following functionalities:
• Allows the doctors to add the records of new patients. The details of the patient, such as name, date-of-birth, address, phone no, infection, injury or any special observations regarding the patient. The doctor can send a request to the hospitals in the case of
further consultation or for CAT (computerized axial tomography) scan or X-ray or any concerned department for other medical tests.
• The doctor at a particular clinic/ centre can add, edit and view the records of the current any patient depending on the condition.
• Allows sorting, search functionality and reporting (for example, show the names of patients appointments in the current week and a daily and weekly report for those patients that visited the clinic/ centre.
• Extra functionalities that makes this web application more attractive product for the doctors/ consultants chosen by you.
In the implementation of the application use suitable design patterns.
Deploy your application to a suitable Cloud Platform as a Service, for example, Heroku.

## Database
The system uses a Postgres database (as is deployed to heroku). Setup:
rake db:create
rake db:migrate
rake db:seed

## Login
Check the top of seeds.rb file for some logins
