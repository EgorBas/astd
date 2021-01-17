package by.astd.astd.controller;

import by.astd.astd.domain.Station;
import by.astd.astd.repos.StationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@PreAuthorize("hasAuthority({'ADMIN', 'SERVICE_MANAGER'})")
public class StationAddController {
    @Autowired
    private StationRepo stationRepo;

    @GetMapping("/stationAdd")
    public String registration(Model model) {
        return "stationAdd";
    }

    @PostMapping("/stationAdd")
    public String addStation(Station station,
                             Model model) {
        Station stationFromDB = stationRepo.findByStationname(station.getStationname());

        if (stationFromDB != null) {
            model.addAttribute("message", "Такой поьзователь уже существует");
            return "stationAdd";
        }

        stationRepo.save(station);

        return "redirect:/station";
    }
}
