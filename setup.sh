#!/bin/bash

# Navegar para a raiz do projeto
cd ~/Projetos/base-prototipai

# Certificar-se de que a pasta 'public' existe
echo "Criando pasta public..."
mkdir -p public/assets/css public/assets/fonts public/assets/images public/assets/js

# Mover arquivos CSS para a pasta public
echo "Movendo arquivos CSS para public..."
if [ -f "assets/css/bootstrap.min.css" ]; then
  mv assets/css/bootstrap.min.css public/assets/css/
fi
if [ -f "assets/css/font-awesome.min.css" ]; then
  mv assets/css/font-awesome.min.css public/assets/css/
fi

# Mover arquivos de fontes para a pasta public
echo "Movendo arquivos de fontes para public..."
if [ -f "assets/fonts/FontAwesome.otf" ]; then
  mv assets/fonts/FontAwesome.otf public/assets/fonts/
fi
if [ -f "assets/fonts/fontawesome-webfont.eot" ]; then
  mv assets/fonts/fontawesome-webfont.eot public/assets/fonts/
fi
if [ -f "assets/fonts/fontawesome-webfont.svg" ]; then
  mv assets/fonts/fontawesome-webfont.svg public/assets/fonts/
fi
if [ -f "assets/fonts/fontawesome-webfont.ttf" ]; then
  mv assets/fonts/fontawesome-webfont.ttf public/assets/fonts/
fi
if [ -f "assets/fonts/fontawesome-webfont.woff" ]; then
  mv assets/fonts/fontawesome-webfont.woff public/assets/fonts/
fi
if [ -f "assets/fonts/fontawesome-webfont.woff2" ]; then
  mv assets/fonts/fontawesome-webfont.woff2 public/assets/fonts/
fi

# Mover arquivos de imagens para a pasta public
echo "Movendo arquivos de imagens para public..."
if [ -f "assets/images/logo-white.png" ]; then
  mv assets/images/logo-white.png public/assets/images/
fi
if [ -f "assets/images/logo.png" ]; then
  mv assets/images/logo.png public/assets/images/
fi
if [ -f "assets/images/user.png" ]; then
  mv assets/images/user.png public/assets/images/
fi

# Mover arquivos JS para a pasta public
echo "Movendo arquivos JS para public..."
if [ -f "assets/js/bootstrap-progressbar.min.js" ]; then
  mv assets/js/bootstrap-progressbar.min.js public/assets/js/
fi
if [ -f "assets/js/bootstrap.min.js" ]; then
  mv assets/js/bootstrap.min.js public/assets/js/
fi
if [ -f "assets/js/custom.min.js" ]; then
  mv assets/js/custom.min.js public/assets/js/
fi
if [ -f "assets/js/jquery.min.js" ]; then
  mv assets/js/jquery.min.js public/assets/js/
fi

# Criar um arquivo index.html na pasta public se não existir
if [ ! -f "public/index.html" ]; then
  echo "Criando arquivo public/index.html..."
  touch public/index.html
  echo "<!DOCTYPE html>
<html lang='en'>
<head>
  <meta charset='UTF-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <title>Base Prototipai</title>
  <link rel='stylesheet' href='assets/css/bootstrap.min.css'>
  <link rel='stylesheet' href='assets/css/font-awesome.min.css'>
</head>
<body>
  <h1>Bem-vindo ao Base Prototipai</h1>
  <script src='assets/js/jquery.min.js'></script>
  <script src='assets/js/bootstrap.min.js'></script>
</body>
</html>" > public/index.html
fi

echo "Estrutura de pastas e arquivos verificada."

# Configurar Vercel
echo "Preparando para deploy no Vercel..."

# Criar arquivo vercel.json
echo "Criando arquivo vercel.json..."
cat <<EOT >> vercel.json
{
  "version": 2,
  "builds": [
    {
      "src": "public/index.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/public/index.html"
    }
  ]
}
EOT

echo "Deploy script completo. Agora você pode fazer deploy para o Vercel."
echo "Execute 'vercel --prod' para fazer o deploy."
