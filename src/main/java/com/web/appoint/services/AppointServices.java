package com.web.appoint.services;

import com.core.service.CoreService;
import com.web.appoint.model.entities.Appointment;

import java.util.List;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 07:47
 */
public interface AppointServices extends CoreService {
    Appointment makeAppoint(Appointment appointment);
    Boolean deleteAppoint(Integer id);
    Appointment editAppoint(Appointment appointment);
    List<Appointment> findAllAppoint();
    List<Appointment> findAppointBasedOnStatus(Integer status);
}
