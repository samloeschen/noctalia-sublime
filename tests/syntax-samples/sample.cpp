#include <cstdint>
#include <string>

namespace noctalia {
template <typename T>
struct Palette final {
    static constexpr std::uint32_t fallback = 0xff00ffaa;
    T value;

    [[nodiscard]] auto label() const -> std::string {
        return value ? "active" : "inactive";
    }
};
} // namespace noctalia
