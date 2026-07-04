@tool
extends McpClient

func _init() -> void:
    id = "hermes"
    display_name = "Hermes"
    config_type = "json"
    doc_url = "https://hermes-agent.nousresearch.com/docs"
    
    # Hermes stores MCP config like other JSON-based clients
    path_template = {
        "unix": "~/.hermes/mcp.json",
        "windows": "%APPDATA%/hermes/mcp.json"
    }
    
    # Standard JSON location for MCP servers
    server_key_path = ["mcpServers"]
    
    # Standard field name for URL in MCP configs
    entry_url_field = "url"
    
    # Transport requirement - must be streamable-http for Hermes
    entry_extra_fields = {"type": "streamable-http"}
    
    # Initial fields when creating a new entry (preserves user customizations)
    entry_initial_fields = {}
    
    # No UVX bridge needed - Hermes is HTTP-native
    entry_uvx_bridge = UvxBridge.NONE
    
    # No special detection paths - config file existence is sufficient
    detect_paths = PackedStringArray()