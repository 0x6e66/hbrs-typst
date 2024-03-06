# A [Typst](https://typst.app/) template for [HBRS](https://www.h-brs.de/)-theses

## Usage
Without changing the template, the only files you need to modify are:
- `ads/`
  - `acronyms.typ`: define acronyms
  - `meta.typ`: set personal information and general metadata about your thesis
- `module_de/`: the actual content of the thesis in german
- `module_en/`: the actual content of the thesis in english

### Compile
```bash
typst compile main.typ
```
