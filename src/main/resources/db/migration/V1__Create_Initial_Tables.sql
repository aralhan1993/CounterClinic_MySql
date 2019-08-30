CREATE TABLE walkin_appointments (
     walkin_appointment_id int auto_increment primary key,
     patient_first_name VARCHAR2(255) NOT NULL,
     patient_last_name varchar2(255) not null,
     appointed_doctor_id int not null,
     appointment_number int not null,
     created_at datetime default concat(current_date, ' ', current_time)
);

CREATE TABLE walkin_appointment_status (
   walkin_appointment_status_id int auto_increment primary key,
   current_appointment_id int not null ,
   doctor_id int not null ,
   avg_wait_time int not null ,
   appointment_start_datetime datetime not null ,
   doctor_break_duration int default 0,
   patients_in_visited_queue int default 0,
   created_at datetime default concat(current_date, ' ', current_time)
);

create table users_meta (
    users_meta_id int auto_increment primary key,
    user_id int not null ,
    meta_key varchar(55) not null ,
    meta_value varchar(255) not null
);

CREATE TABLE qrcode_attachments (
    qrcode_id int auto_increment primary key ,
    appointment_id int not null ,
    height int not null ,
    width int not null ,
    image_name varchar(255) not null ,
    image_file_path varchar(255) not null ,
    image_url_path varchar(255) not null ,
    qrcode_data varchar(500) not null ,
    created_at datetime default concat(current_date, ' ', current_time)
);

CREATE TABLE users (
    user_id int auto_increment primary key ,
    first_name varchar(255) not null ,
    last_name varchar(255) not null ,
    email varchar(255) not null ,
    mobile varchar(12) not null ,
    username varchar(55) not null ,
    password varchar(255) not null ,
    preferred_language varchar(25) not null ,
    created_at datetime default concat(current_date, ' ', current_time)
);

CREATE TABLE user_roles (
    user_id int not null ,
    role_name varchar(64)
);

CREATE TABLE settings (
    setting_id int auto_increment primary key ,
    setting_name varchar(64) not null ,
    setting_value varchar(64) not null
);

CREATE TABLE users_login (
    user_id int not null ,
    username varchar(255) not null ,
    password varchar(255) not null ,
    logged_in_at datetime
);

// WalkInAppointments
INSERT INTO walkin_appointments (patient_first_name, patient_last_name, appointed_doctor_id, appointment_number)
VALUES ( 'First Name 1', 'Last Name 1', 1, 1);
INSERT INTO walkin_appointments (patient_first_name, patient_last_name, appointed_doctor_id, appointment_number)
VALUES ( 'First Name 2', 'Last Name 2', 1, 1);
INSERT INTO walkin_appointments (patient_first_name, patient_last_name, appointed_doctor_id, appointment_number)
VALUES ( 'First Name 3', 'Last Name 3', 1, 1);

// QRCodeAttachments
INSERT INTO qrcode_attachments (appointment_id, height, width, image_name, image_file_path, image_url_path, qrcode_data)
values ( 1, 300, 300, 'testimage01.png', 'src/main/resources/static/qrcode/1564860895258.png', 'qrcode/1564860895258.png', '{"appointmentId": 1, "appointedDoctorId": 1}' );
INSERT INTO qrcode_attachments (appointment_id, height, width, image_name, image_file_path, image_url_path, qrcode_data)
values ( 2, 300, 300, 'testimage02.png', 'src/main/resources/static/qrcode/1564860895741.png', 'qrcode/1564860895741.png', '{"appointmentId": 2, "appointedDoctorId": 1}' );
INSERT INTO qrcode_attachments (appointment_id, height, width, image_name, image_file_path, image_url_path, qrcode_data)
values ( 3, 300, 300, 'testimage03.png', 'src/main/resources/static/qrcode/1564860895620.png', 'qrcode/1564860895620.png', '{"appointmentId": 3, "appointedDoctorId": 1}' );

// WalkInAppointmentStatus
INSERT INTO walkin_appointment_status (current_appointment_id, doctor_id, avg_wait_time, appointment_start_datetime)
values ( 1, 1, 15, CONCAT(CURRENT_DATE, ' ', CURRENT_TIME) );
INSERT INTO walkin_appointment_status (current_appointment_id, doctor_id, avg_wait_time, appointment_start_datetime)
values ( 2, 1, 15, CONCAT(CURRENT_DATE, ' ', CURRENT_TIME) );

// Users
INSERT INTO users (first_name, last_name, email, mobile, username, password, preferred_language)
VALUES ( 'Varun', 'Shrivastava', 'varunshrivastava007@gmail.com', '9960543885', 'vslala', 'simplepass', 'ENGLISH' );

// UserRole
INSERT INTO user_roles (user_id, role_name) VALUES ( 1, 'SUPER_ADMIN' );

// UsersMeta
INSERT INTO users_meta (user_id, meta_key, meta_value)
VALUES ( 1, 'assigned_clinic_room', 'Test Clinic' );

// Settings
INSERT INTO settings (setting_name, setting_value) VALUES ( 'Setting_One', 'Setting_Two' );