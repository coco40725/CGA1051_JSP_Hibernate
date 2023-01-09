package com.web.job.model.entities;

import com.core.entities.Core;
import lombok.*;

import javax.persistence.*;
import java.io.Serial;
import java.sql.Date;


/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 10:19
 */

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "salon_schedule", catalog = "ipetdb")
public class JobSchedule extends Core {
    @Serial
    private static final long serialVersionUID = 3L;

    @Column(name = "SCH_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer schID;
    @Column(name = "SCH_DATE")
    private Date schDate;
    @Column(name = "SCH_PERIOD")
    private String schPeriod;
    @Column(name = "GROOMER_ID")
    private Integer groomerID;
    @Transient
    private String groomerName;
    @Column(name = "ASST_ID_1")
    private Integer asstID1;
    @Transient
    private String asstID1Name;
    @Column(name = "ASST_ID_2")
    private Integer asstID2;
    @Transient
    private String asstID2Name;
    @Column(name = "EMPLOYEE_NOTE")
    private String employeeNote;
    @Transient
    private Integer ampId;



    public JobSchedule(Date schDate, String schPeriod, Integer groomerID, Integer asstID1, Integer asstID2, String employeeNote) {
        this.schDate = schDate;
        this.schPeriod = schPeriod;
        this.groomerID = groomerID;
        this.asstID1 = asstID1;
        this.asstID2 = asstID2;
        this.employeeNote = employeeNote;
    }
}
