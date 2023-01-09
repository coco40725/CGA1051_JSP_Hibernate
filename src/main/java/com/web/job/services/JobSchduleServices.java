package com.web.job.services;

import com.web.job.model.entities.JobSchedule;
import com.core.service.CoreService;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author Yu-Jing
 * @create 2023/1/3 下午 08:12
 */
public interface JobSchduleServices extends CoreService {
    JobSchedule[] addJobs(JobSchedule[] jobSchedules);
    Boolean deleteJob(Integer id);
    JobSchedule editJob(JobSchedule jobSchedule);
    List<JobSchedule> findAllJobs();
    JobSchedule findJobByID(Integer id);
    Set<Object> findIllegalDatesToAddJobs(Integer groomerId, Integer asstId1, Integer asstId2, String period);
}
