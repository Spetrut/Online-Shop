package ro.msg.learning.shop.dtos;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StockDto {
    private Integer productId;
    private Integer locationId;
    private Integer quantity;

}
