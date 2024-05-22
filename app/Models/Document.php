<?php

namespace App\Models;

use App\DocumentType;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    use HasFactory;

    protected $fillable = ['type',];

    protected $casts = [
        'type' => DocumentType::class
    ];
}
