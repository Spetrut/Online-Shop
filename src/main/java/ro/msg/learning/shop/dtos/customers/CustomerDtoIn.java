package ro.msg.learning.shop.dtos.customers;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerDtoIn {
    private String firstName;
    private String lastName;
    private String username;
    private String password;
}
