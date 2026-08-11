import os
import re
import base64

MODULE_DIR = "module"
OUTPUT_DIR = "build"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "main.lua")
MINIFY_FILE = os.path.join(OUTPUT_DIR, "main.min.lua")
OBF_FILE = os.path.join(OUTPUT_DIR, "main.obf.lua")

SECRET_PASSWORD = "APPLECATHUBMEOMEObyNguyenMinhNhat1301@@@@!" 

os.makedirs(OUTPUT_DIR, exist_ok=True)

files = [f for f in os.listdir(MODULE_DIR) if f.endswith(".lua")]
files.sort()

final_code = ""
for file in files:
    path = os.path.join(MODULE_DIR, file)
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()
    final_code += content + "\n"

with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    f.write(final_code)
print(f"[+] Success: {OUTPUT_FILE}")

def advanced_minify_lua(code):
    pattern = re.compile(
        r'(--\[(?P<c_eq>=*)\[.*?\](?P=c_eq)\])|'
        r'(--[^\n]*)|'
        r'(\[(?P<s_eq>=*)\[.*?\](?P=s_eq)\])|'
        r'("(?:[^"\\]|\\.)*")|'
        r"('(?:[^'\\]|\\.)*')",
        re.DOTALL
    )

    def replace(match):
        if match.group(1) or match.group(2):
            return ''
        return match.group(0)

    clean_code = pattern.sub(replace, code)

    minified_lines = []
    for line in clean_code.splitlines():
        line = line.strip()
        if line:
            minified_lines.append(line)

    return "\n".join(minified_lines)

minified_code = advanced_minify_lua(final_code)

with open(MINIFY_FILE, "w", encoding="utf-8") as f:
    f.write(minified_code)
print(f"[+] Success: {MINIFY_FILE}")

def password_encrypt(data_bytes, key_str):
    key_bytes = key_str.encode('utf-8')
    out = bytearray()
    for i, byte in enumerate(data_bytes):
        k_byte = key_bytes[i % len(key_bytes)]
        encrypted_byte = (byte + k_byte) % 256
        out.append(encrypted_byte)
    return bytes(out)

encrypted_data = password_encrypt(minified_code.encode('utf-8'), SECRET_PASSWORD)
base64_encoded = base64.b64encode(encrypted_data).decode('utf-8')

lua_stub = f"""local KEY = "{SECRET_PASSWORD}"
local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function decode64(data)
    local chars = {{}}
    for i = 1, #b do chars[b:sub(i,i)] = i - 1 end
    data = string.gsub(data, '[^' .. b .. '=]', '')
    local out = {{}}
    local i = 1
    while i <= #data do
        local c1 = chars[data:sub(i,i)]
        local c2 = chars[data:sub(i+1,i+1)]
        local c3 = chars[data:sub(i+2,i+2)]
        local c4 = chars[data:sub(i+3,i+3)]
        if not c1 or not c2 then break end
        table.insert(out, string.char((c1 * 4) + math.floor(c2 / 16)))
        if c3 then
            table.insert(out, string.char(((c2 % 16) * 16) + math.floor(c3 / 4)))
            if c4 then
                table.insert(out, string.char(((c3 % 4) * 64) + c4))
            end
        end
        i = i + 4
    end
    return table.concat(out)
end
local function decrypt(data, key)
    local out = {{}}
    for i = 1, #data do
        local b_char = string.byte(data, i)
        local k_char = string.byte(key, ((i - 1) % #key) + 1)
        table.insert(out, string.char((b_char - k_char) % 256))
    end
    return table.concat(out)
end
local payload = "{base64_encoded}"
local success, result = pcall(function()
    local decrypted_source = decrypt(decode64(payload), KEY)
    local run = assert((loadstring or load)(decrypted_source), "Error")
    run()
end)
if not success then
    error("Error: " .. tostring(result))
end
"""

with open(OBF_FILE, "w", encoding="utf-8") as f:
    f.write(lua_stub)
print(f"[+] Success: {OBF_FILE}")
