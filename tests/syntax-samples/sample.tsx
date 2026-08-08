import type { ReactNode } from "react";

type PaletteProps<T> = Readonly<{
    value: T;
    children?: ReactNode;
}>;

export function Palette<T>({ value, children }: PaletteProps<T>) {
    const label = `${String(value ?? "empty")}`;
    return <section data-value={label}>{children ?? label}</section>;
}
