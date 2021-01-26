package by.asuod.servcie;

import by.asuod.domain.Station;
import by.asuod.repos.StationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StationService {
    @Autowired
    private StationRepo stationRepo;

    public boolean addStation(Station station) {
        Station StationFromDB = stationRepo.findByStationname(station.getStationname());
        if (StationFromDB != null) {
            return false;
        }

        stationRepo.save(station);
        return true;
    }

    public boolean stationSave(Station stationform, Station station) {
        station.setStationnumber(stationform.getStationnumber());
        station.setStationcode(stationform.getStationcode());
        station.setStationtype(stationform.getStationtype());
        station.setStationname(stationform.getStationname());
        station.setStationaddress(stationform.getStationaddress());
        station.setActive(stationform.isActive());

        stationRepo.save(station);
        return true;
    }

    public List<Station> findAll() {
        return stationRepo.findAll();
    }

    public void delete(Station station) {
        stationRepo.delete(station);
    }
}
