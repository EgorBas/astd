package by.astd.astd.controller;

import by.astd.astd.domain.Role;
import by.astd.astd.domain.User;
import by.astd.astd.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping
    public String userList (Model model){
        model.addAttribute("users", userRepo.findAll());
        return "userAll";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @GetMapping("/del/{user}")
    public String userDelete(@PathVariable User user, Model model){
        userRepo.delete(user);
        model.addAttribute("users", userRepo.findAll());
        return "userAll";
    }

    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam String firstname,
            @RequestParam String lastname,
            @RequestParam String patronymic,
            @RequestParam String password,
            @RequestParam String email,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user){

        user.setUsername(username);
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setPatronymic(patronymic);
        user.setPassword(password);
        user.setEmail(email);
        //user.setActive(active);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
        return "redirect:/user";
    }
}
