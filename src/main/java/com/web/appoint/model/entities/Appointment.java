package com.web.appoint.model.entities;

import com.core.model.entities.Core;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;

/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 10:31
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "salon_appointment", catalog = "ipetdb")
public class Appointment extends Core {
    private static final long serialVersionUID = 1L;
    @Column(name = "APM_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer ampID;
    @Column(name = "APM_STATUS")
    private Integer ampStatus;
    @Transient
    private String ampStatusDesc;
    @Column(name = "MEM_ID")
    private Integer memID;
    @Transient
    private String memName;
    @Column(name = "PET_ID")
    private Integer  petID;
    @Transient
    private String petName;
    @Column(name = "SCH_ID")
    private Integer schID;
    @Transient
    private Date schDate;
    @Transient
    private String schPeriod;
    @Column(name = "APM_BUILD_TIME", insertable = false)
    private Timestamp apmBuildTime;
    @Column(name = "CUSTOMER_NOTE")
    private String customerNote;
    @Column(name = "TOTAL_PRICE")
    private Integer totalPrice;
    @Transient
    private AppointmentDetail[] appointmentDetails;


    public Appointment(Integer ampStatus, Integer memID, Integer petID, Integer schID, Timestamp apmBuildTime, String customerNote, Integer totalPrice) {
        this.ampStatus = ampStatus;
        this.memID = memID;
        this.petID = petID;
        this.schID = schID;
        this.apmBuildTime = apmBuildTime;
        this.customerNote = customerNote;
        this.totalPrice = totalPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Appointment that = (Appointment) o;
        return ampID.equals(that.ampID) && ampStatus.equals(that.ampStatus) && memID.equals(that.memID) && petID.equals(that.petID) && schID.equals(that.schID) && apmBuildTime.equals(that.apmBuildTime) && Objects.equals(customerNote, that.customerNote) && totalPrice.equals(that.totalPrice) && appointmentDetails.equals(that.appointmentDetails);
    }


    @Override
    public int hashCode() {
        return Objects.hash(ampID, ampStatus, memID, petID, schID, apmBuildTime, customerNote, totalPrice, appointmentDetails);
    }
}
