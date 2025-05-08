* anytype
* Beaver notes                                                                                        To convert your **Markdown pages into**:

1. ✅ **A PDF book**
2. ✅ **A single HTML file**

You can use **Pandoc** – the best tool for this kind of task.

---

### 🔧 Requirements

Install Pandoc and a PDF engine:

#### On Linux (Debian/Ubuntu/Raspberry Pi):

```bash
sudo apt update
sudo apt install pandoc texlive-xetex
```

#### On Termux (Android):

```bash
pkg install pandoc texlive
```

---

### 📁 Step 1: Organize your markdown files

Make sure your files are in order, e.g.:

```
book/
├── Step 1.md
├── Step 2.md
├── Step 3.md
└── Step 4.md
```

Create a file like `book.txt` listing them in order:

```text
Step 1.md
Step 2.md
Step 3.md
Step 4.md
```

---

### 📘 Generate PDF book

Use this command:

```bash
pandoc $(cat book.txt) -o MyBook.pdf --pdf-engine=xelatex
```

Or for a fancier look with a title page:

```bash
pandoc $(cat book.txt) -o MyBook.pdf --pdf-engine=xelatex --metadata title="My Book Title"
```

---

### 🌐 Generate single HTML file

```bash
pandoc $(cat book.txt) -o MyBook.html --standalone
```

You can also embed all styles and images:

```bash
pandoc $(cat book.txt) -o MyBook.html --standalone --self-contained
```

---

Would you like a custom CSS theme or a cover page added to your book?
