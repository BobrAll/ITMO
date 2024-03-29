package bobr.blps_lab1.user;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository repository;

    public Optional<User> findByEmail(String email) {
        return repository.findByEmail(email);
    }

    public Optional<User> findByLogin(String login) {
        return repository.findUserByLogin(login);
    }

    public Optional<User> findById(Integer id) {
        return repository.findById(id);
    }

    public void save(User user) {
        repository.save(user);
    }
}
