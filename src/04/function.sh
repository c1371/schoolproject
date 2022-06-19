function generate_random_ip {
local random_numbers=$(shuf -e $(seq 0 255) -n 4)
declare -a random_numbers_array
local random_numbers_array=($random_numbers)
local ip_address="${random_numbers_array[0]}.${random_numbers_array[1]}.${random_numbers_array[2]}.${random_numbers_array[3]}"
echo "$ip_address"
}