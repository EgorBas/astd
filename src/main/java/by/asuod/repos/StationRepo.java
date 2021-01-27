package by.asuod.repos;

import by.asuod.domain.Station;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StationRepo extends JpaRepository<Station, Long> {

    Station findByStationname(String stationname);

}
