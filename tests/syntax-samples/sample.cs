using System;

namespace Noctalia.Sample;

[Obsolete("fixture")]
public sealed class Palette<T> where T : class
{
    private readonly T value;

    public Palette(T value) => this.value = value;

    public async Task<string> FormatAsync(int count)
    {
        await Task.Delay(10);
        return $"{value}: {count:N2}";
    }
}
