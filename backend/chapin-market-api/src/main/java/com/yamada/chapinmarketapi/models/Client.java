package com.yamada.chapinmarketapi.models;

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
    private ClientCard clientCard;

    @OneToMany(mappedBy = "client", fetch = FetchType.LAZY)
    private List<Bill> bills;
}
