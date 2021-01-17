package by.astd.astd.repos;

import by.astd.astd.domain.Station;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StationRepo extends JpaRepository<Station, Long> {

    Station findByStationname(String stationname);

}
