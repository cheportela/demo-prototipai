#!/bin/bash

# Navegar para a raiz do projeto
cd ~/Projetos/base-prototipai

# Renomear a pasta 'home' para 'index', caso ela existisse (sem esse passo agora)
# echo "A pasta 'home' não foi encontrada."

# Certificar-se de que a estrutura de pastas está correta
echo "Verificando pastas necessárias..."
mkdir -p assets/css assets/fonts assets/images assets/js

# Mover arquivos CSS para a pasta correta se eles ainda não estiverem lá
echo "Verificando arquivos CSS..."
if [ ! -f "assets/css/bootstrap.min.css" ]; then
  mv assets/css/bootstrap.min.css assets/css/
fi
if [ ! -f "assets/css/font-awesome.min.css" ]; then
  mv assets/css/font-awesome.min.css assets/css/
fi

# Mover arquivos de fontes para a pasta correta se eles ainda não estiverem lá
echo "Verificando arquivos de fontes..."
if [ ! -f "assets/fonts/FontAwesome.otf" ]; then
  mv assets/fonts/FontAwesome.otf assets/fonts/
fi
if [ ! -f "assets/fonts/fontawesome-webfont.eot" ]; then
  mv assets/fonts/fontawesome-webfont.eot assets/fonts/
fi
if [ ! -f "assets/fonts/fontawesome-webfont.svg" ]; then
  mv assets/fonts/fontawesome-webfont.svg assets/fonts/
fi
if [ ! -f "assets/fonts/fontawesome-webfont.ttf" ]; then
  mv assets/fonts/fontawesome-webfont.ttf assets/fonts/
fi
if [ ! -f "assets/fonts/fontawesome-webfont.woff" ]; then
  mv assets/fonts/fontawesome-webfont.woff assets/fonts/
fi
if [ ! -f "assets/fonts/fontawesome-webfont.woff2" ]; then
  mv assets/fonts/fontawesome-webfont.woff2 assets/fonts/
fi

# Mover arquivos de imagens para a pasta correta se eles ainda não estiverem lá
echo "Verificando arquivos de imagens..."
if [ ! -f "assets/images/logo-white.png" ]; then
  mv assets/images/logo-white.png assets/images/
fi
if [ ! -f "assets/images/logo.png" ]; then
  mv assets/images/logo.png assets/images/
fi
if [ ! -f "assets/images/user.png" ]; then
  mv assets/images/user.png assets/images/
fi

# Mover arquivos JS para a pasta correta se eles ainda não estiverem lá
echo "Verificando arquivos JS..."
if [ ! -f "assets/js/bootstrap-progressbar.min.js" ]; then
  mv assets/js/bootstrap-progressbar.min.js assets/js/
fi
if [ ! -f "assets/js/bootstrap.min.js" ]; then
  mv assets/js/bootstrap.min.js assets/js/
fi
if [ ! -f "assets/js/custom.min.js" ]; then
  mv assets/js/custom.min.js assets/js/
fi
if [ ! -f "assets/js/jquery.min.js" ]; then
  mv assets/js/jquery.min.js assets/js/
fi

# Criar um arquivo index.html se não existir
if [ ! -f "index.html" ]; then
  echo "Criando arquivo index.html..."
  touch index.html
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
</html>" > index.html
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
      "src": "index.html",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/index.html"
    }
  ]
}
EOT

echo "Deploy script completo. Agora você pode fazer deploy para o Vercel."
echo "Execute 'vercel --prod' para fazer o deploy."
