use std::fmt::{self, Display};

pub trait Render {
    type Output;
    fn render(&self) -> Self::Output;
}

#[derive(Debug)]
pub struct Palette<T> {
    value: T,
}

impl<T: Display> Render for Palette<T> {
    type Output = String;

    fn render(&self) -> String {
        format!("value: {}", self.value)
    }
}
