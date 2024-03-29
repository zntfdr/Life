// rows 10
// columns 30

    let L: [Cell] = [
      Cell(row: 1, column: 1),
      Cell(row: 1, column: 2),
      Cell(row: 1, column: 3),
      Cell(row: 1, column: 4),
      Cell(row: 2, column: 1),
      Cell(row: 2, column: 4),
      Cell(row: 3, column: 1),
      Cell(row: 3, column: 4),
      Cell(row: 4, column: 1),
      Cell(row: 4, column: 4),
      Cell(row: 5, column: 1),
      Cell(row: 5, column: 4),
      Cell(row: 5, column: 5),
      Cell(row: 5, column: 6),
      Cell(row: 5, column: 7),
      Cell(row: 6, column: 1),
      Cell(row: 6, column: 7),
      Cell(row: 7, column: 1),
      Cell(row: 7, column: 2),
      Cell(row: 7, column: 3),
      Cell(row: 7, column: 4),
      Cell(row: 7, column: 5),
      Cell(row: 7, column: 6),
      Cell(row: 7, column: 7),
      Cell(row: 8, column: 1),
      Cell(row: 8, column: 2),
      Cell(row: 8, column: 3),
      Cell(row: 8, column: 4),
      Cell(row: 8, column: 5),
      Cell(row: 8, column: 6),
      Cell(row: 8, column: 7)
    ]

    let I: [Cell] = [
      Cell(row: 1, column: 9),
      Cell(row: 1, column: 10),
      Cell(row: 1, column: 11),
      Cell(row: 1, column: 12),
      Cell(row: 2, column: 9),
      Cell(row: 2, column: 12),
      Cell(row: 3, column: 9),
      Cell(row: 3, column: 12),
      Cell(row: 4, column: 9),
      Cell(row: 4, column: 12),
      Cell(row: 5, column: 9),
      Cell(row: 5, column: 12),
      Cell(row: 6, column: 9),
      Cell(row: 6, column: 12),
      Cell(row: 7, column: 9),
      Cell(row: 7, column: 10),
      Cell(row: 7, column: 11),
      Cell(row: 7, column: 12),
      Cell(row: 8, column: 9),
      Cell(row: 8, column: 10),
      Cell(row: 8, column: 11),
      Cell(row: 8, column: 12)
    ]

    let F: [Cell] = [
      Cell(row: 1, column: 14),
      Cell(row: 1, column: 15),
      Cell(row: 1, column: 16),
      Cell(row: 1, column: 17),
      Cell(row: 1, column: 18),
      Cell(row: 1, column: 19),
      Cell(row: 1, column: 20),
      Cell(row: 2, column: 14),
      Cell(row: 2, column: 20),
      Cell(row: 3, column: 14),
      Cell(row: 3, column: 17),
      Cell(row: 3, column: 18),
      Cell(row: 3, column: 19),
      Cell(row: 3, column: 20),
      Cell(row: 4, column: 14),
      Cell(row: 4, column: 19),
      Cell(row: 4, column: 20),
      Cell(row: 5, column: 14),
      Cell(row: 5, column: 14),
      Cell(row: 5, column: 17),
      Cell(row: 5, column: 18),
      Cell(row: 5, column: 19),
      Cell(row: 6, column: 14),
      Cell(row: 6, column: 14),
      Cell(row: 6, column: 17),
      Cell(row: 6, column: 18),
      Cell(row: 6, column: 19),
      Cell(row: 7, column: 14),
      Cell(row: 7, column: 15),
      Cell(row: 7, column: 16),
      Cell(row: 7, column: 17),
      Cell(row: 8, column: 14),
      Cell(row: 8, column: 15),
      Cell(row: 8, column: 16),
      Cell(row: 8, column: 17)
    ]

    let E: [Cell] = [
      Cell(row: 1, column: 22),
      Cell(row: 1, column: 23),
      Cell(row: 1, column: 24),
      Cell(row: 1, column: 25),
      Cell(row: 1, column: 26),
      Cell(row: 1, column: 27),
      Cell(row: 1, column: 28),
      Cell(row: 2, column: 22),
      Cell(row: 2, column: 28),
      Cell(row: 3, column: 22),
      Cell(row: 3, column: 25),
      Cell(row: 3, column: 26),
      Cell(row: 3, column: 27),
      Cell(row: 3, column: 28),
      Cell(row: 4, column: 22),
      Cell(row: 4, column: 27),
      Cell(row: 5, column: 22),
      Cell(row: 5, column: 25),
      Cell(row: 5, column: 26),
      Cell(row: 5, column: 27),
      Cell(row: 5, column: 28),
      Cell(row: 6, column: 22),
      Cell(row: 6, column: 28),
      Cell(row: 7, column: 22),
      Cell(row: 7, column: 23),
      Cell(row: 7, column: 24),
      Cell(row: 7, column: 25),
      Cell(row: 7, column: 26),
      Cell(row: 7, column: 27),
      Cell(row: 7, column: 28),
      Cell(row: 8, column: 22),
      Cell(row: 8, column: 23),
      Cell(row: 8, column: 24),
      Cell(row: 8, column: 25),
      Cell(row: 8, column: 26),
      Cell(row: 8, column: 27),
      Cell(row: 8, column: 28)
    ]

    for cell in [L,I,F,E].flatMap({ $0 }) {
      world.add(cell)
    }