package gomel.iba.by;

import gomel.iba.by.exceptions.IncorrectEmailException;
import gomel.iba.by.exceptions.UserAlreadyExistsException;
import gomel.iba.by.exceptions.UserNotFoundException;
import gomel.iba.by.exceptions.ValidationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class UserExceptionController {

    @ExceptionHandler(UserAlreadyExistsException.class)
    public ResponseEntity<Object> exception(UserAlreadyExistsException e) {
        return new ResponseEntity<>("Can't add user because he already exists ", HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(ValidationException.class)
    public ResponseEntity<Object> exception(ValidationException e) {
        return new ResponseEntity<>("You inserted not enough information or wrong information", HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<Object> exception(UserNotFoundException e) {
        return new ResponseEntity<>("Chosen user doesn't exist", HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(IncorrectEmailException.class)
    public ResponseEntity<Object> exception(IncorrectEmailException e) {
        return new ResponseEntity<>("Incorrect email", HttpStatus.BAD_REQUEST);
    }
}
