package by.astd.astd.controller;

import by.astd.astd.domain.Station;
import by.astd.astd.repos.StationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/station")
@PreAuthorize("hasAuthority({'ADMIN', 'SERVICE_MANAGER'})")
public class StationController {
    @Autowired
    private StationRepo stationRepo;

    @GetMapping
    public String stationList(Model model) {
        model.addAttribute("stations", stationRepo.findAll());
        return "stationList";
    }

    @GetMapping("{station}")
    public String stationEditForm(@PathVariable Station station, Model model) {
        model.addAttribute("station", station);
        return "stationEdit";
    }

    @GetMapping("/del/{station}")
    public String stationDelete(@PathVariable Station station, Model model) {
        stationRepo.delete(station);
        model.addAttribute("stations", stationRepo.findAll());
        return "stationList";
    }

    @PostMapping
    public String stationSave(
            @RequestParam int stationnumber,
            @RequestParam String stationcode,
            @RequestParam String stationtype,
            @RequestParam String stationname,
            @RequestParam String stationaddress,
            @RequestParam boolean active,
            @RequestParam("stationId") Station station) {

        station.setStationnumber(stationnumber);
        station.setStationcode(stationcode);
        station.setStationtype(stationtype);
        station.setStationname(stationname);
        station.setStationaddress(stationaddress);
        station.setActive(active);

        stationRepo.save(station);
        return "redirect:/station";
    }
}
