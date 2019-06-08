package com.codesvenue.counterclinic.user;

import com.codesvenue.counterclinic.clinic.Clinic;
import com.codesvenue.counterclinic.qrcode.QRCode;
import com.codesvenue.counterclinic.walkinappointment.WalkInAppointment;

public interface UserRepository {
    Clinic createNewClinic(Clinic newClinic);

    WalkInAppointment createNewWalkInAppointment(WalkInAppointment walkInAppointment);

    User findDoctorById(Integer doctorId);

    QRCode createNewQRCode(QRCode qrCode);
}
