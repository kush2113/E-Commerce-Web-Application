package lk.ijse.assignment01javaee_project.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private int p_id;
    private String p_name;
    private int c_id;
    private String discription;
    private int qty;
    private BigDecimal price;
    private String image;
}
