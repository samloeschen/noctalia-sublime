from dataclasses import dataclass
from typing import Generic, TypeVar

T = TypeVar("T")


@dataclass(frozen=True)
class Palette(Generic[T]):
    """Small syntax-highlighting fixture."""

    value: T

    async def render(self, count: int = 1) -> str:
        match self.value:
            case None:
                return "empty"
            case value:
                return f"{value!r:>{count}}"
