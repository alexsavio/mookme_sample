# Install backend dependencies...

```bash
cd backend
make deps/install-dev
```

# Install frontend dependencies

```bash
cd frontend
npm i
```

# Setup mookme

```bash
npm install --global @escape.tech/mookme
npx mookme init --only-hook --added-behaviour pre-commit --skip-types-selection
```
