# YAML

YAML (YAML Ain't Markup Language) is a way to write data in a format that's easy for humans to read and write. It's commonly used for configuration files in software applications.

Here’s a simple breakdown:

- `Structure`: YAML organizes data using indentation (spaces or tabs) to show relationships between items. This makes it clear how different pieces of information relate to each other.

- `Data Types`: YAML supports different types of data, like text (strings), numbers, lists (arrays of items), and key-value pairs (like dictionaries or maps).

-----------------

JSON
```json
{
  "Employee": {
    "Name": "Jacob",
    "Sex": "Male",
    "Age": 30,
    "Title": "Systems Engineer",
    "Projects": [
      "Automation",
      "Support"
    ],
    "Payslips": [
      { "Month": "June", "Wage": 4000 },
      { "Month": "July", "Wage": 4500 },
      { "Month": "August", "Wage": 4000 }
    ]
  }
}


```
-------------

YAML

```yaml
Employee:
  Name: Jacob
  Sex: Male
  Age: 30
  Title: Systems Engineer
  Projects:
    - Automation
    - Support
  Payslips:
    - Month: June
      Wage: 4000
    - Month: July
      Wage: 4500
    - Month: August
      Wage: 4000

```

IMP:
When to Choose Which?

`JSON`:

Use JSON for APIs and data interchange where compatibility with a wide range of systems and programming languages is crucial.
Ideal for scenarios requiring simple and well-defined data structures.


`YAML`:

Use YAML for configuration files, especially in environments where human readability and maintainability are important.
Suitable for more complex data structures and nested configurations that benefit from a clear and concise format.