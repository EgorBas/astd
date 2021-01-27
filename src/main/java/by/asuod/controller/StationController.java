package by.asuod.controller;

import by.asuod.domain.Station;
import by.asuod.servcie.StationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;

@Controller
@PreAuthorize("hasAnyAuthority('ADMIN', 'SERVICE_MANAGER')")
public class StationController {
    @Autowired
    private StationService stationService;

    @GetMapping("/stationAdd")
    public String registration(Model model) {
        return "stationAdd";
    }

    @PostMapping("/stationAdd")
    public String addStation(@Valid Station station,
                             BindingResult bindingResult,
                             Model model) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("station", station);
        } else {
            if (!stationService.addStation(station)) {
                model.addAttribute("message", "ПТЭ с таким названием уже существует");
                model.addAttribute("messagetype", "danger");
                return "stationAdd";
            }
            model.addAttribute("message", "ПТЭ успешно добавлен");
            model.addAttribute("messagetype", "success");
            model.addAttribute("station", null);
        }
        return "stationAdd";
    }

    @GetMapping("/station")
    public String stationList(Model model) {
        model.addAttribute("stations", stationService.findAll());
        return "stationList";
    }

    @GetMapping("/station/{station}")
    public String stationEditForm(@PathVariable Station station, Model model) {
        model.addAttribute("station", station);
        return "stationEdit";
    }

    @GetMapping("/station/del/{station}")
    public String stationDelete(@PathVariable Station station, Model model) {
        stationService.delete(station);
        model.addAttribute("stations", stationService.findAll());
        return "stationList";
    }

    @PostMapping("/station")
    public String stationSave(
            @Valid Station stationform,
            BindingResult bindingResult,
            @RequestParam("stationId") Station station,
            Model model) {

        model.addAttribute("station", station);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("stationform", stationform);
            model.addAttribute("hasvaliderror", true);
        } else {
            if (!stationService.stationSave(stationform, station)) {
                //Заглушка на случай ошибки
                model.addAttribute("message", "Сообщениеоб ошибке");
                return "userEdit";
            }
            model.addAttribute("message", "Данные сохранены");
            model.addAttribute("messagetype", "success");
        }

        return "stationEdit";
    }
}
