/*
** EPITECH PROJECT, 2022
** tests_flavio
** File description:
** test2
*/

#define PI 3.14159265358979323846
#define choix(x) (x == 1) ? (x = 2) : (x = 1)
#define print_value(value) printf("%d\n", value); value = 0;
#define increment(x) x = x + 1
#define decrement(x) x = x - 1
#define add(x, y) x = x + y
#define sub(x, y) x = x - y
#define mul(x, y) x = x * y
#define div(x, y) x = x / y
#define mod(x, y) x = x % y
#define pow(x, y) x = x ^ y
#define sqrt(x) x = sqrt(x)
#define sin(x) x = sin(x)
#define cos(x) x = cos(x)
#define tan(x) x = tan(x)
#define asin(x) x = asin(x)
#define acos(x) x = acos(x)
#define atan(x) x = atan(x)
#define atan2(x, y) x = atan2(x, y)
#define log(x) x = log(x)
#define log10(x) x = log10(x)
#define exp(x) x = exp(x)
#define fabs(x) x = fabs(x)
#define fmod(x, y) x = fmod(x, y)
#define ceil(x) x = ceil(x)
#define floor(x) x = floor(x)
#define round(x) x = round(x)
#define nearbyint(x) x = nearbyint(x)
#define trunc(x) x = trunc(x)
#define fmin(x, y) x = fmin(x, y)
#define fmax(x, y) x = fmax(x, y)
#define fmal(x, y, z) x = fmal(x, y, z)
#define fminf(x, y) x = fminf(x, y)
#define fmaxf(x, y) x = fmaxf(x, y)
#define fmaf(x, y, z) x = fmaf(x, y, z)
#define fclamp(x, y, z) x = fclamp(x, y, z)
#define fclampf(x, y, z) x = fclampf(x, y, z)
#define fmix(x, y, z) x = fmix(x, y, z)
#define fmixf(x, y, z) x = fmixf(x, y, z)
#define fstep(x, y) x = fstep(x, y)
#define fstepf(x, y) x = fstepf(x, y)
#define fma(x, y, z) x = fma(x, y, z)
#define fmaf(x, y, z) x = fmaf(x, y, z)
#define fms(x, y, z) x = fms(x, y, z)
#define fmsf(x, y, z) x = fmsf(x, y, z)
#define fsel(x, y, z) x = fsel(x, y, z)
#define fself(x, y, z) x = fself(x, y, z)
#define f distance(x, y) x = distance(x, y)
#define f distancef(x, y) x = distancef(x, y)
#define f distance_squared(x, y) x = distance_squared(x, y)
#define f distance_squaredf(x, y) x = distance_squaredf(x, y)
#define f distance_squared_signed(x, y) x = distance_squared_signed(x, y)
#define f distance_squared_signedf(x, y) x = distance_squared_signedf(x, y)
#define f dot(x, y) x = dot(x, y)
#define f dotf(x, y) x = dotf(x, y)
#define f cross(x, y) x = cross(x, y)
#define f crossf(x, y) x = crossf(x, y)
#define f normalize(x) x = normalize(x)
#define f normalizef(x) x = normalizef(x)
#define f normalize_to(x, y) x = normalize_to(x, y)
#define f normalize_tof(x, y) x = normalize_tof(x, y)
#define f faceforward(x, y, z) x = faceforward(x, y, z)
#define f faceforwardf(x, y, z) x = faceforwardf(x, y, z)
#define f reflect(x, y) x = reflect(x, y)
#define f reflectf(x, y) x = reflectf(x, y)
#define f refract(x, y, z) x = refract(x, y, z)
#define f refractf(x, y, z) x = refractf(x, y, z)
#define f length(x) x = length(x)
#define f lengthf(x) x = lengthf(x)
#define f length_squared(x) x = length_squared(x)
#define f length_squaredf(x) x = length_squaredf(x)
#define f length_squared_signed(x) x = length_squared_signed(x)
#define f length_squared_signedf(x) x = length_squared_signedf(x)
#define f distance(x, y) x = distance(x, y)
#define f distancef(x, y) x = distancef(x, y)
#define f distance_squared(x, y) x = distance_squared(x, y)
#define f distance_squaredf(x, y) x = distance_squaredf(x, y)
#define f distance_squared_signed(x, y) x = distance_squared_signed(x, y)
#define f distance_squared_signedf(x, y) x = distance_squared_signedf(x, y)
#define f dot(x, y) x = dot(x, y)
#define f dotf(x, y) x = dotf(x, y)
#define f cross(x, y) x = cross(x, y)
#define f crossf(x, y) x = crossf(x, y)
#define f normalize(x) x = normalize(x)
#define f normalizef(x) x = normalizef(x)
#define f normalize_to(x, y) x = normalize_to(x, y)
#define f normalize_tof(x, y) x = normalize_tof(x, y)
#define f faceforward(x, y, z) x = faceforward(x, y, z)
#define f faceforwardf(x, y, z) x = faceforwardf(x, y, z)
#define f reflect(x, y) x = reflect(x, y)
#define f reflectf(x, y) x = reflectf(x, y)
#define f refract(x, y, z) x = refract(x, y, z)
#define f refractf(x, y, z) x = refractf(x, y, z)
#define f length(x) x = length(x)
#define f lengthf(x) x = lengthf(x)
#define f length_squared(x) x = length_squared(x)
#define f length_squaredf(x) x = length_squaredf(x)
#define f length_squared_signed(x) x = length_squared_signed(x)
#define f length_squared_signedf(x) x = length_squared_signedf(x)
#define force inline
#define forcex(value) value++, value--
#define forcex_if(value, condition) if (condition) value++, value--

int main(void)
{
    return 0;
}
