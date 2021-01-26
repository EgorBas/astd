package by.asuod.controller;

import by.asuod.domain.Role;
import by.asuod.domain.User;
import by.asuod.servcie.UserService;
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
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserService userService;


    @GetMapping("/userAdd")
    public String registration(Model model) {
        model.addAttribute("roles", Role.values());
        return "userAdd";
    }

    @PostMapping("/userAdd")
    public String addUser(@RequestParam Map<String, String> form,
                          @Valid User user,
                          BindingResult bindingResult,
                          Model model) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("user", user);
        } else {
            if (!userService.addUser(form, user)) {
                model.addAttribute("message", "Пользователь с таким логином уже существует");
                model.addAttribute("messagetype", "danger");
                model.addAttribute("roles", Role.values());
                return "userAdd";
            }
            model.addAttribute("message", "Пользователь успешно добавлен");
            model.addAttribute("messagetype", "success");
            model.addAttribute("user", null);
        }
        model.addAttribute("roles", Role.values());
        return "userAdd";
    }

    @GetMapping("/user")
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());
        return "userAll";
    }

    @GetMapping("/user/{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @GetMapping("/user/del/{user}")
    public String userDelete(@PathVariable User user, Model model) {
        userService.delete(user);
        model.addAttribute("users", userService.findAll());
        return "userAll";
    }

    @PostMapping("/user")
    public String userSave(
            @Valid User userform,
            BindingResult bindingResult,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user,
            Model model) {

        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("user", user);
            model.addAttribute("userform", userform);
            model.addAttribute("hasvaliderror", true);
        } else {
            if (!userService.userSave(userform, form, user)) {
                //Заглушка на случай ошибки
                model.addAttribute("message", "Сообщениеоб ошибке");
                model.addAttribute("roles", Role.values());
                return "userEdit";
            }
            model.addAttribute("message", "Профиль сохранен");
            model.addAttribute("messagetype", "success");
        }
        return "userEdit";
    }
}
