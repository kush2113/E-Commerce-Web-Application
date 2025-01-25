package lk.ijse.assignment01javaee_project.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class User {
   private long id;
   private String name;
   private String role;
   private String email;
   private  String password;

    public User(long id, String name, String role, String email) {
        this.id = id;
        this.name = name;
        this.role = role;
        this.email = email;
    }
}
