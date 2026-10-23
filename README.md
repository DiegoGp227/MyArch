# Hyprland Rice

Configuración modular de **Hyprland** en **Arch Linux** con lanzador **Fuzzel** (Wayland), tema ciberpunk (azul neón + morado), scripts de batería/brillo y lockscreen estilo seguridad.

## 📋 Requisitos

- Hyprland
- kitty (terminal)
- thunar (gestor de archivos)
- fuzzel (lanzador de aplicaciones)
- waybar (barra)
- hypridle + hyprlock (bloqueo)
- hyprpaper (wallpaper)
- waypaper (restaurar wallpaper)
- swaync (notificaciones)
- grim + slurp + wl-copy (capturas)
- brightnessctl / ddcutil (brillo)
- wpctl + playerctl (audio)
- JetBrainsMono Nerd Font

Instalar lo esencial en Arch:

```bash
sudo pacman -S hyprland kitty thunar fuzzel spotify waybar hypridle hyprlock hyprpaper waypaper swaync grim slurp wl-copy brightnessctl wpctl playerctl ttf-jetbrains-mono-nerd
```

## 📁 Estructura

```
hypr/
├── hyprland.conf          # Config principal (source modular)
├── hypridle.conf          # Inactividad / suspensión
├── hyprlock.conf          # Lockscreen ciberpunk
├── hyprpaper.conf         # Wallpaper
├── configs/
│   ├── apps.conf          # Variables de aplicaciones
│   ├── autostart.conf     # Ejecutar al iniciar
│   ├── animations.conf    # Animaciones de Hyprland
│   ├── appearance.conf    # Bordes, gaps, blur, sombras
│   ├── bindings.conf      # Atajos de teclado y ratón
│   ├── env.conf           # Variables de entorno
│   ├── input.conf         # Teclado, ratón, touchpad
│   ├── layout.conf        # Layout dwindle/master
│   └── monitors.conf      # Monitores fijos
└── scripts/
    ├── battery-alert.sh   # Alertas de batería
    ├── external-brightness.sh # Brillo monitor externo (ddcutil)
    ├── lock.sh            # Bloquear pantalla
    ├── set-wallpaper.sh   # Fijar wallpaper en todos los monitores
    └── toggle-laptop.sh   # Activar/desactivar pantalla del laptop
fuzzel/
└── fuzzel.ini             # Tema del lanzador (ciberpunk)
```

## 🚀 Instalación

1. Clona el repositorio:

```bash
git clone https://github.com/TU_USUARIO/hyprland-rice.git
cd hyprland-rice
```

2. Copia los archivos a tu configuración:

```bash
cp -r hypr/* ~/.config/hypr/
cp -r fuzzel ~/.config/
```

3. Ajusta `hypr/configs/monitors.conf` con los nombres de tus monitores (`eDP-1`, `HDMI-A-1`, etc.).

4. Ajusta `hypr/hyprpaper.conf` y `hypr/scripts/set-wallpaper.sh` con la ruta de tus wallpapers.

5. Reinicia Hyprland (`SUPER + R` o `hyprctl reload`).

## ⌨️ Atajos principales

| Atajo | Acción |
|-------|--------|
| `SUPER + Q` | Terminal (kitty) |
| `SUPER + E` | Gestor de archivos (thunar) |
| `SUPER + T` | Spotify |
| `SUPER + SPACE` | Lanzador de aplicaciones (fuzzel) |
| `SUPER + D` | Cerrar ventana activa |
| `SUPER + V` | Flotante |
| `SUPER + M` | Apagar Hyprland |
| `SUPER + 1-0` | Cambiar escritorio |
| `SUPER + SHIFT + 1-0` | Mover ventana a escritorio |
| `F12` | Capturar región al portapapeles |

## ⚠️ Notas

- Rutas con `$HOME` para ser portables.
- `hyprlock.conf` muestra `HOST: hack4u`; cámbialo en la sección **INFORMACIÓN DEL SISTEMA**.
- Los archivos `.bak`, `logs/` y `backup*/` están ignorados en `.gitignore`.

## 📜 Licencia

MIT
