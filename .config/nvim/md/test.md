---
title: CSS Test Document
author: Ali Alquied
date: 2026-07-08
---

# H1 Heading

## H2 Heading

### H3 Heading

#### H4 Heading

##### H5 Heading

###### H6 Heading

## Paragraphs and Emphasis

Regular paragraph text with **bold**, *italic*, ***bold italic***, ~~strikethrough~~, and `inline code`. Here's a [link to example](https://example.com) and an auto link: <https://example.com>.

Subscript: H~2~O. Superscript: X^2^.

A line with a  
manual line break above.

Second paragraph to test paragraph spacing. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

---

## Blockquotes

> This is a blockquote.
> It spans multiple lines.
>
> > Nested blockquote.
> > Second line of nested quote.

## Lists

### Unordered

- Item one
- Item two
  - Nested item
  - Another nested item
    - Deeply nested item
- Item three

### Ordered

1. First item
2. Second item
   1. Nested ordered
   2. Another nested
3. Third item

### Task List

- [x] Completed task
- [ ] Incomplete task
- [ ] Another incomplete task
  - [x] Nested completed subtask

### Definition List

Term 1
:   Definition for term 1

Term 2
:   Definition for term 2
:   Second definition for term 2

## Code

Inline code: `const x = 5;`

Fenced code block, no language:

```
plain text block
no syntax highlighting
```

Fenced code block with language:

```python
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a

print(fibonacci(10))
```

```javascript
function greet(name) {
  return `Hello, ${name}!`;
}
console.log(greet("world"));
```

```bash
#!/usr/bin/env bash
for f in *.md; do
  pandoc "$f" -o "${f%.md}.html"
done
```

Indented code block (4 spaces):

    this is an indented code block
    second line

## Tables

| Left aligned | Center aligned | Right aligned |
|:-------------|:--------------:|--------------:|
| a            | b              | c             |
| longer text  | x              | 100           |
| short        | medium text    | 42            |

Simple table without alignment:

| Name | Age | City |
| --- | --- | --- |
| Alice | 30 | NYC |
| Bob | 25 | LA |

## Images

![Alt text for image](https://via.placeholder.com/400x200 "Placeholder image title")

## Horizontal Rules

Above this line.

---

***

___

Below all three rules.

## Footnotes

Here's a sentence with a footnote.[^1]

Another footnote reference.[^note]

[^1]: This is the first footnote.
[^note]: This is a named footnote with **bold** text and `code`.

## Math (if MathJax/KaTeX enabled)

Inline math: $E = mc^2$

Block math:

$$
\int_{-\infty}^{\infty} e^{-x^2} \, dx = \sqrt{\pi}
$$

## HTML Passthrough

<div style="border: 1px solid red; padding: 10px;">
  Raw HTML block with inline styling.
</div>

<details>
<summary>Click to expand</summary>

Hidden content revealed on click. Useful for testing `<details>`/`<summary>` styling.

</details>

## Abbreviations

*[HTML]: Hyper Text Markup Language
*[CSS]: Cascading Style Sheets

The HTML and CSS abbreviations should show tooltips if supported.

## Emoji (if supported)

:smile: :rocket: :warning:

## Escaping

\*Not italic\*, \`not code\`, \# not a heading.

## Long Content Stress Test

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Final Section

End of test document.

