package by.astd.astd.domain;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "stations")
public class Station {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull(message = "Поле \"Номер ПТЭ\", не может быть пустым")
    @Min(value = 1, message = "Номер ПТЭ должен быть больше либо равен 1")
    private int stationnumber;
    @NotBlank(message = "Поле \"Код ПТЭ\", не может быть пустым")
    private String stationcode;
    @NotBlank(message = "Поле \"Тип ПТЭ\", не может быть пустым")
    private String stationtype;
    @NotBlank(message = "Поле \"Название ПТЭ\", не может быть пустым")
    private String stationname;
    @NotBlank(message = "Поле \"Адрес ПТЭ\", не может быть пустым")
    private String stationaddress;
    @NotNull(message = "Поле \"Статус ПТЭ\", не может быть пустым")
    private boolean active;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getStationnumber() {
        return stationnumber;
    }

    public void setStationnumber(int stationnumber) {
        this.stationnumber = stationnumber;
    }

    public String getStationcode() {
        return stationcode;
    }

    public void setStationcode(String stationcode) {
        this.stationcode = stationcode;
    }

    public String getStationtype() {
        return stationtype;
    }

    public void setStationtype(String stationtype) {
        this.stationtype = stationtype;
    }

    public String getStationname() {
        return stationname;
    }

    public void setStationname(String stationname) {
        this.stationname = stationname;
    }

    public String getStationaddress() {
        return stationaddress;
    }

    public void setStationaddress(String stationaddress) {
        this.stationaddress = stationaddress;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
