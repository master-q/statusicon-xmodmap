using Gtk;

public class Main {
  class AppStatusIcon : Window {
    private StatusIcon trayicon;
    private Gtk.Menu menuSystem;
    private AboutDialog aboutDialog;

    public AppStatusIcon() {
      /* Create tray icon */
      trayicon = new StatusIcon.from_icon_name("go-up");
      trayicon.set_tooltip_text ("statusicon-xmodmap");
      trayicon.set_visible(true);

      trayicon.activate.connect(xmodmap_clicked);

      create_menuSystem();
      trayicon.popup_menu.connect(menuSystem_popup);
    }

    /* Create menu for right button */
    public void create_menuSystem() {
      menuSystem = new Gtk.Menu();

      var box = new Box (Orientation.HORIZONTAL, 6);
      var label = new Label ("Terminal");
      var menuItem = new Gtk.MenuItem();
      box.add (label);
      menuItem.add (box);
      menuItem.activate.connect(terminal_clicked);
      menuSystem.append(menuItem);

      box = new Box (Orientation.HORIZONTAL, 6);
      label = new Label ("Xmodmap");
      menuItem = new Gtk.MenuItem();
      box.add (label);
      menuItem.add (box);
      menuItem.activate.connect(xmodmap_clicked);
      menuSystem.append(menuItem);

      box = new Box (Orientation.HORIZONTAL, 6);
      label = new Label ("About");
      menuItem = new Gtk.MenuItem();
      box.add (label);
      menuItem.add (box);
      menuItem.activate.connect(about_clicked);
      menuSystem.append(menuItem);

      menuSystem.show_all();
    }

    private void menuSystem_popup(uint button, uint time) {
      menuSystem.popup(null, null, null, button, time);
    }

	private void terminal_clicked() {
      try {
        string[] spawn_args = {"x-terminal-emulator"};
        string[] spawn_env = Environ.get();
        Process.spawn_async ("/", spawn_args, spawn_env, SpawnFlags.SEARCH_PATH, null, null);
      } catch (SpawnError e) {
      }
    }

	private void xmodmap_clicked() {
      try {
        string home = GLib.Environment.get_home_dir();
        string[] spawn_args = {"xmodmap", ".Xmodmap"};
        string[] spawn_env = Environ.get();
        Process.spawn_sync (home, spawn_args, spawn_env, SpawnFlags.SEARCH_PATH, null);
      } catch (SpawnError e) {
      }
    }

    private void about_clicked() {
      if (aboutDialog == null) {
        aboutDialog = new AboutDialog();
        aboutDialog.set_version("0.1.0");
        aboutDialog.set_program_name("statusicon-xmodmap");
        aboutDialog.set_comments("StatusIcon for custom keymap user to run xmodmap");
      }

      aboutDialog.run();
      aboutDialog.hide();
    }
  }

  public static int main (string[] args) {
    Gtk.init(ref args);
    var App = new AppStatusIcon();
    App.hide();
    Gtk.main();
    return 0;
  }
}
