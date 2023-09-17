package com.yamada.chapinmarketapi.models;

import com.yamada.chapinmarketapi.dto.ClientDTO;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "clients", schema = "schema_clients")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "nit")
public class Client {

    @Id
    private String nit;
    private String clientName;

    @OneToOne
    @JoinColumn(name = "nit")
    private ClientCard clientCard;

    @OneToMany(mappedBy = "client", fetch = FetchType.LAZY)
    private List<Bill> bills;

    public Client(ClientDTO clientDTO) {
        this.nit = clientDTO.nit();
        this.clientName = clientDTO.clientName();
    }
}
