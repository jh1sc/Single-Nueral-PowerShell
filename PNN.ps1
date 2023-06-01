$train = @(
    @(0, 0),
    @(1, 2),
    @(2, 4),
    @(3, 6),
    @(4, 8)
)

$train_count = $train.Length

function rand_float {
    return [float](Get-Random) / [float]::MaxValue
}

function cost($w) {
    $result = 0.0
    $n = $train_count

    for ($i = 0; $i -lt $n; $i++) {
        $x = $train[$i][0]
        $y = $x * $w
        $d = $y - $train[$i][1]
        $result += $d * $d
    }

    $result /= $n
    return $result
}

function dcost($w) {
    $result = 0.0
    $n = $train_count

    for ($i = 0; $i -lt $n; $i++) {
        $x = $train[$i][0]
        $y = $train[$i][1]
        $result += 2 * ($x * $w - $y) * $x
    }

    $result /= $n
    return $result
}

$w = rand_float * 10.0
$rate = 1e-1

Write-Host "cost = $(cost($w)), w = $w"

for ($i = 0; $i -lt 50; $i++) {
    $dw = dcost($w)
    $w -= $rate * $dw
    Write-Host "cost = $(cost($w)), w = $w"
}

Write-Host "------------------------------"
Write-Host "Made By JH1SC"
Write-Host "w = $w"