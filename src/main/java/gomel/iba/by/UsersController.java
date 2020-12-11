package gomel.iba.by;

import gomel.iba.by.exceptions.IncorrectEmailException;
import gomel.iba.by.exceptions.UserAlreadyExistsException;
import gomel.iba.by.exceptions.UserNotFoundException;
import gomel.iba.by.exceptions.ValidationException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@RestController
public class UsersController {

    private static final Logger log = Logger.getLogger(UsersController.class);

    @Autowired
    UserRepository userRepository;

    @GetMapping("/")
    public List<User> showUsers() {
        List<User> users = userRepository.findAll();
        return users;
    }

    @PostMapping("/add")
    public User addUser(@RequestBody User user) {
        log.info(user);
        if (userRepository.findFirstByUsername(user.getUsername()).isPresent()) {
            log.info("This user already exists");
            throw new UserAlreadyExistsException();
        }
        if (user.getFullname() == null || user.getMail() == null || user.getPassword() == null || user.getUsername() == null
            || user.getFullname().equals("") || user.getMail().equals("") || user.getPassword().equals("")
            || user.getUsername().equals("")) {
            log.info("Validation error");
            throw new ValidationException();
        }
        if (!checkEmail(user.getMail())) {
            throw new IncorrectEmailException();
        }
        userRepository.save(user);
        user = userRepository.findOne(Example.of(user)).get();
        log.info("info: user [" + user.getId() + "] created");
        return user;
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Object> deleteUser(@PathVariable Long id) {
        if (userRepository.findById(id).isPresent()) {
            userRepository.deleteById(id);
        } else {
            log.info("User wasn't found");
            throw new UserNotFoundException();
        }
        return ResponseEntity.noContent().build();
    }

    public static boolean checkEmail(String email) {
        Pattern pattern = Pattern.compile("[a-zA-Z0-9]+?@\\w+?\\.\\w+");
        Matcher matcher = pattern.matcher(email);
        boolean check = false;
        if (matcher.find()) {
            check = true;
        }
        return check;
    }
}
