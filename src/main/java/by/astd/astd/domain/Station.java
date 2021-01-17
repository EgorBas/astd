package by.astd.astd.domain;

import javax.persistence.*;

@Entity
@Table(name = "stations")
public class Station {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private int stationnumber;
    private String stationcode;
    private String stationtype;
    private String stationname;
    private String stationaddress;
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
