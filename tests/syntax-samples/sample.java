package noctalia.sample;

import java.util.Optional;

@Deprecated
public record Palette<T>(T value) {
    public Optional<String> label() {
        return Optional.ofNullable(value).map(Object::toString);
    }
}
