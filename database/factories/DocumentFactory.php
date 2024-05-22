<?php

namespace Database\Factories;

use App\DocumentType;
use Illuminate\Database\Eloquent\Factories\Factory;

use Illuminate\Support\Arr;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Document>
 */
class DocumentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'type' => Arr::random(DocumentType::cases())->value,
        ];
    }
}
