package com.web.appoint.model.entities;

import com.core.model.entities.Core;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * @author Yu-Jing
 * @create 2022-12-24-上午 10:36
 */

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity
@IdClass(AppointmentDetail.PK.class)
@Table(name = "salon_appointment_detail", catalog = "ipetdb")
public class AppointmentDetail extends Core {
    private static final long serialVersionUID = 2L;
    public  static class PK implements Serializable{
        private static final long serialVersionUID = 22L;
        @Column(name ="APM_ID")
        @Id
        public Integer ampId;
        @Column(name ="SVC_ID")
        @Id
        public Integer svcId;

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            PK pk = (PK) o;
            return ampId.equals(pk.ampId) && svcId.equals(pk.svcId);
        }

        @Override
        public int hashCode() {
            return Objects.hash(ampId, svcId);
        }
    }
    @Column(name ="APM_ID")
    @Id
    private Integer ampId;
    @Column(name ="SVC_ID")
    @Id
    private Integer svcId;
    @Transient
    private String svcName;
    @Column(name = "SALE_ID")
    private Integer saleId;
    @Transient
    private String saleName;
    @Column(name = "SVC_PRICE")
    private Integer svcPrice;
    @Column(name = "SALE_PRICE")
    private Integer salePrice;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AppointmentDetail that = (AppointmentDetail) o;
        return ampId.equals(that.ampId) && svcId.equals(that.svcId) && saleId.equals(that.saleId) && svcPrice.equals(that.svcPrice) && salePrice.equals(that.salePrice);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ampId, svcId, saleId, svcPrice, salePrice);
    }
}
