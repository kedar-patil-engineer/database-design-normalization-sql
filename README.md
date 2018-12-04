# Database Design, Normalization and Data Extraction

A relational database design project that takes a university enrollment schema from an
unnormalized form through 1NF, 2NF, and 3NF, defines referential integrity, and extracts
data with SQL.

> **Note on dates:** This project was originally completed in late 2018 as a BAN 610
> Modern Database Systems project during my MS in Business Analytics at California State
> University, East Bay. It was uploaded to GitHub in June 2026 after my previous GitHub
> account was deleted. Commit dates are set to reflect the original completion date.

## Overview

This project models a university course enrollment domain (students, courses,
instructors, books, programs, and enrollments) and applies relational database design
principles to remove redundancy and enforce integrity. The schema is normalized step by
step and then implemented in SQL for data extraction.

## What It Covers

- **Unnormalized schedule relation** capturing students, majors, graduation semester,
  courses, credit hours, classrooms, course books, publishers, and instructors
- **First Normal Form (1NF)** - removing repeating groups
- **Second Normal Form (2NF)** - splitting into Student, Course, Instructor, Book, and
  Student Enrollment tables to remove partial dependencies
- **Third Normal Form (3NF)** - introducing a Program table to remove transitive
  dependencies
- **Referential integrity** - defining primary and foreign key relationships across
  tables
- **Entity Relationship Diagram** - visualizing the final schema
- **SQL** - data extraction queries against the designed schema

## Tech Stack

Relational database design, normalization (1NF, 2NF, 3NF), SQL, entity relationship
modeling.

## Files

- `MiniProject.sql` - SQL schema and data extraction queries
- `_Entity Relationship Diagram.png` - ER diagram of the final design
- `Database Design and steps performed/` - normalization steps (1NF, 2NF, 3NF,
  referential integrity, relations)

## License

This project is released under the MIT License. See [LICENSE](LICENSE).

## Author

Kedar Patil - MS Business Analytics, California State University, East Bay
