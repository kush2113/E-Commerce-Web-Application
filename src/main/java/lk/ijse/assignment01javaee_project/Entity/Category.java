package lk.ijse.assignment01javaee_project.Entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Category {

    private int categoryId;
    private String categoryName;
    private String categoryImage;

    public Category(int categoryId, String categoryName) {

        this.categoryId = categoryId;
        this.categoryName = categoryName;
    }
}
