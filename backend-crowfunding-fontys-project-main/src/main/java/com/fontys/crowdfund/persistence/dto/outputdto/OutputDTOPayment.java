package com.fontys.crowdfund.persistence.dto.outputdto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OutputDTOPayment {

    private int paymentId;
    private int projectId;
    private String backerEmail;
    private double amountFunded;
    private Date paymentDate;

}
