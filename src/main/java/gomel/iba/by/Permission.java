package gomel.iba.by;

public enum Permission {
    PERMISSION_READ("permission:read"), PERMISSION_WRITE("permission:write");

    private final String permission;

    Permission(String permission) {
        this.permission = permission;
    }

    public String getPermission() {
        return permission;
    }
}
